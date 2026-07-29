# Explore: explore_0249
# Auto-generated LookML Explore File

include: "/views/domain_48/view_00748.view.lkml"
include: "/views/domain_50/view_00750.view.lkml"
include: "/views/domain_01/view_00751.view.lkml"
include: "/views/domain_02/view_00752.view.lkml"

explore: explore_0249 {
  label: "Explore Explore 0249"
  description: "Comprehensive analytics explore joining base view_00748 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00748
  
  always_filter: {
    filters: [view_00748.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00748.created_at_date: "7 days"]
    unless: [view_00748.id, view_00748.status]
  }

  join: view_00750 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00748.user_id} = ${view_00750.id} ;;
    required_joins: []
  }

  join: view_00751 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00748.account_id} = ${view_00751.account_id} ;;
    required_joins: [view_00750]
  }

  join: view_00752 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00748.category} = ${view_00752.category} ;;
  }

  access_filter: {
    field: view_00748.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00748.is_deleted} = false ;;
}
