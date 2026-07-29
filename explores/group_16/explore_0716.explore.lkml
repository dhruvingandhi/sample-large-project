# Explore: explore_0716
# Auto-generated LookML Explore File

include: "/views/domain_49/view_02149.view.lkml"
include: "/views/domain_01/view_02151.view.lkml"
include: "/views/domain_02/view_02152.view.lkml"
include: "/views/domain_03/view_02153.view.lkml"

explore: explore_0716 {
  label: "Explore Explore 0716"
  description: "Comprehensive analytics explore joining base view_02149 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02149
  
  always_filter: {
    filters: [view_02149.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02149.created_at_date: "7 days"]
    unless: [view_02149.id, view_02149.status]
  }

  join: view_02151 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02149.user_id} = ${view_02151.id} ;;
    required_joins: []
  }

  join: view_02152 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02149.account_id} = ${view_02152.account_id} ;;
    required_joins: [view_02151]
  }

  join: view_02153 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02149.category} = ${view_02153.category} ;;
  }

  access_filter: {
    field: view_02149.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02149.is_deleted} = false ;;
}
