# Explore: explore_0250
# Auto-generated LookML Explore File

include: "/views/domain_01/view_00751.view.lkml"
include: "/views/domain_03/view_00753.view.lkml"
include: "/views/domain_04/view_00754.view.lkml"
include: "/views/domain_05/view_00755.view.lkml"

explore: explore_0250 {
  label: "Explore Explore 0250"
  description: "Comprehensive analytics explore joining base view_00751 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00751
  
  always_filter: {
    filters: [view_00751.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00751.created_at_date: "7 days"]
    unless: [view_00751.id, view_00751.status]
  }

  join: view_00753 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00751.user_id} = ${view_00753.id} ;;
    required_joins: []
  }

  join: view_00754 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00751.account_id} = ${view_00754.account_id} ;;
    required_joins: [view_00753]
  }

  join: view_00755 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00751.category} = ${view_00755.category} ;;
  }

  access_filter: {
    field: view_00751.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00751.is_deleted} = false ;;
}
