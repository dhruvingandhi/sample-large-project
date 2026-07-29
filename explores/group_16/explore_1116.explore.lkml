# Explore: explore_1116
# Auto-generated LookML Explore File

include: "/views/domain_49/view_03349.view.lkml"
include: "/views/domain_01/view_03351.view.lkml"
include: "/views/domain_02/view_03352.view.lkml"
include: "/views/domain_03/view_03353.view.lkml"

explore: explore_1116 {
  label: "Explore Explore 1116"
  description: "Comprehensive analytics explore joining base view_03349 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03349
  
  always_filter: {
    filters: [view_03349.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03349.created_at_date: "7 days"]
    unless: [view_03349.id, view_03349.status]
  }

  join: view_03351 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03349.user_id} = ${view_03351.id} ;;
    required_joins: []
  }

  join: view_03352 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03349.account_id} = ${view_03352.account_id} ;;
    required_joins: [view_03351]
  }

  join: view_03353 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03349.category} = ${view_03353.category} ;;
  }

  access_filter: {
    field: view_03349.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03349.is_deleted} = false ;;
}
