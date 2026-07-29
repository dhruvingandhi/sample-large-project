# Explore: explore_0574
# Auto-generated LookML Explore File

include: "/views/domain_23/view_01723.view.lkml"
include: "/views/domain_25/view_01725.view.lkml"
include: "/views/domain_26/view_01726.view.lkml"
include: "/views/domain_27/view_01727.view.lkml"

explore: explore_0574 {
  label: "Explore Explore 0574"
  description: "Comprehensive analytics explore joining base view_01723 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01723
  
  always_filter: {
    filters: [view_01723.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01723.created_at_date: "7 days"]
    unless: [view_01723.id, view_01723.status]
  }

  join: view_01725 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01723.user_id} = ${view_01725.id} ;;
    required_joins: []
  }

  join: view_01726 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01723.account_id} = ${view_01726.account_id} ;;
    required_joins: [view_01725]
  }

  join: view_01727 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01723.category} = ${view_01727.category} ;;
  }

  access_filter: {
    field: view_01723.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01723.is_deleted} = false ;;
}
