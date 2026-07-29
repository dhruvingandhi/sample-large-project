# Explore: explore_0659
# Auto-generated LookML Explore File

include: "/views/domain_28/view_01978.view.lkml"
include: "/views/domain_30/view_01980.view.lkml"
include: "/views/domain_31/view_01981.view.lkml"
include: "/views/domain_32/view_01982.view.lkml"

explore: explore_0659 {
  label: "Explore Explore 0659"
  description: "Comprehensive analytics explore joining base view_01978 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01978
  
  always_filter: {
    filters: [view_01978.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01978.created_at_date: "7 days"]
    unless: [view_01978.id, view_01978.status]
  }

  join: view_01980 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01978.user_id} = ${view_01980.id} ;;
    required_joins: []
  }

  join: view_01981 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01978.account_id} = ${view_01981.account_id} ;;
    required_joins: [view_01980]
  }

  join: view_01982 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01978.category} = ${view_01982.category} ;;
  }

  access_filter: {
    field: view_01978.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01978.is_deleted} = false ;;
}
