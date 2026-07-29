# Explore: explore_3949
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11848.view.lkml"
include: "/views/domain_50/view_11850.view.lkml"
include: "/views/domain_01/view_11851.view.lkml"
include: "/views/domain_02/view_11852.view.lkml"

explore: explore_3949 {
  label: "Explore Explore 3949"
  description: "Comprehensive analytics explore joining base view_11848 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11848
  
  always_filter: {
    filters: [view_11848.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11848.created_at_date: "7 days"]
    unless: [view_11848.id, view_11848.status]
  }

  join: view_11850 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11848.user_id} = ${view_11850.id} ;;
    required_joins: []
  }

  join: view_11851 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11848.account_id} = ${view_11851.account_id} ;;
    required_joins: [view_11850]
  }

  join: view_11852 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11848.category} = ${view_11852.category} ;;
  }

  access_filter: {
    field: view_11848.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11848.is_deleted} = false ;;
}
