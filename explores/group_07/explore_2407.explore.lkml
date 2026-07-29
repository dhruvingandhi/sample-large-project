# Explore: explore_2407
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07222.view.lkml"
include: "/views/domain_24/view_07224.view.lkml"
include: "/views/domain_25/view_07225.view.lkml"
include: "/views/domain_26/view_07226.view.lkml"

explore: explore_2407 {
  label: "Explore Explore 2407"
  description: "Comprehensive analytics explore joining base view_07222 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07222
  
  always_filter: {
    filters: [view_07222.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07222.created_at_date: "7 days"]
    unless: [view_07222.id, view_07222.status]
  }

  join: view_07224 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07222.user_id} = ${view_07224.id} ;;
    required_joins: []
  }

  join: view_07225 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07222.account_id} = ${view_07225.account_id} ;;
    required_joins: [view_07224]
  }

  join: view_07226 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07222.category} = ${view_07226.category} ;;
  }

  access_filter: {
    field: view_07222.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07222.is_deleted} = false ;;
}
