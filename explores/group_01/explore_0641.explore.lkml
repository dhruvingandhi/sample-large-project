# Explore: explore_0641
# Auto-generated LookML Explore File

include: "/views/domain_24/view_01924.view.lkml"
include: "/views/domain_26/view_01926.view.lkml"
include: "/views/domain_27/view_01927.view.lkml"
include: "/views/domain_28/view_01928.view.lkml"

explore: explore_0641 {
  label: "Explore Explore 0641"
  description: "Comprehensive analytics explore joining base view_01924 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01924
  
  always_filter: {
    filters: [view_01924.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01924.created_at_date: "7 days"]
    unless: [view_01924.id, view_01924.status]
  }

  join: view_01926 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01924.user_id} = ${view_01926.id} ;;
    required_joins: []
  }

  join: view_01927 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01924.account_id} = ${view_01927.account_id} ;;
    required_joins: [view_01926]
  }

  join: view_01928 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01924.category} = ${view_01928.category} ;;
  }

  access_filter: {
    field: view_01924.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01924.is_deleted} = false ;;
}
