# Explore: explore_0677
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02032.view.lkml"
include: "/views/domain_34/view_02034.view.lkml"
include: "/views/domain_35/view_02035.view.lkml"
include: "/views/domain_36/view_02036.view.lkml"

explore: explore_0677 {
  label: "Explore Explore 0677"
  description: "Comprehensive analytics explore joining base view_02032 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02032
  
  always_filter: {
    filters: [view_02032.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02032.created_at_date: "7 days"]
    unless: [view_02032.id, view_02032.status]
  }

  join: view_02034 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02032.user_id} = ${view_02034.id} ;;
    required_joins: []
  }

  join: view_02035 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02032.account_id} = ${view_02035.account_id} ;;
    required_joins: [view_02034]
  }

  join: view_02036 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02032.category} = ${view_02036.category} ;;
  }

  access_filter: {
    field: view_02032.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02032.is_deleted} = false ;;
}
