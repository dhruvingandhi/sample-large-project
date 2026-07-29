# Explore: explore_1377
# Auto-generated LookML Explore File

include: "/views/domain_32/view_04132.view.lkml"
include: "/views/domain_34/view_04134.view.lkml"
include: "/views/domain_35/view_04135.view.lkml"
include: "/views/domain_36/view_04136.view.lkml"

explore: explore_1377 {
  label: "Explore Explore 1377"
  description: "Comprehensive analytics explore joining base view_04132 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04132
  
  always_filter: {
    filters: [view_04132.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04132.created_at_date: "7 days"]
    unless: [view_04132.id, view_04132.status]
  }

  join: view_04134 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04132.user_id} = ${view_04134.id} ;;
    required_joins: []
  }

  join: view_04135 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04132.account_id} = ${view_04135.account_id} ;;
    required_joins: [view_04134]
  }

  join: view_04136 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04132.category} = ${view_04136.category} ;;
  }

  access_filter: {
    field: view_04132.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04132.is_deleted} = false ;;
}
