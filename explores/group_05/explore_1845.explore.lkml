# Update for 500 file diff target
# Explore: explore_1845
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05536.view.lkml"
include: "/views/domain_38/view_05538.view.lkml"
include: "/views/domain_39/view_05539.view.lkml"
include: "/views/domain_40/view_05540.view.lkml"

explore: explore_1845 {
  label: "Explore Explore 1845"
  description: "Comprehensive analytics explore joining base view_05536 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05536
  
  always_filter: {
    filters: [view_05536.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05536.created_at_date: "7 days"]
    unless: [view_05536.id, view_05536.status]
  }

  join: view_05538 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05536.user_id} = ${view_05538.id} ;;
    required_joins: []
  }

  join: view_05539 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05536.account_id} = ${view_05539.account_id} ;;
    required_joins: [view_05538]
  }

  join: view_05540 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05536.category} = ${view_05540.category} ;;
  }

  access_filter: {
    field: view_05536.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05536.is_deleted} = false ;;
}
