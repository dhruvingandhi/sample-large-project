# Explore: explore_1102
# Auto-generated LookML Explore File

include: "/views/domain_07/view_03307.view.lkml"
include: "/views/domain_09/view_03309.view.lkml"
include: "/views/domain_10/view_03310.view.lkml"
include: "/views/domain_11/view_03311.view.lkml"

explore: explore_1102 {
  label: "Explore Explore 1102"
  description: "Comprehensive analytics explore joining base view_03307 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03307
  
  always_filter: {
    filters: [view_03307.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03307.created_at_date: "7 days"]
    unless: [view_03307.id, view_03307.status]
  }

  join: view_03309 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03307.user_id} = ${view_03309.id} ;;
    required_joins: []
  }

  join: view_03310 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03307.account_id} = ${view_03310.account_id} ;;
    required_joins: [view_03309]
  }

  join: view_03311 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03307.category} = ${view_03311.category} ;;
  }

  access_filter: {
    field: view_03307.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03307.is_deleted} = false ;;
}
