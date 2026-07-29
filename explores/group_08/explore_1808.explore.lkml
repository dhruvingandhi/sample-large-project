# Explore: explore_1808
# Auto-generated LookML Explore File

include: "/views/domain_25/view_05425.view.lkml"
include: "/views/domain_27/view_05427.view.lkml"
include: "/views/domain_28/view_05428.view.lkml"
include: "/views/domain_29/view_05429.view.lkml"

explore: explore_1808 {
  label: "Explore Explore 1808"
  description: "Comprehensive analytics explore joining base view_05425 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05425
  
  always_filter: {
    filters: [view_05425.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05425.created_at_date: "7 days"]
    unless: [view_05425.id, view_05425.status]
  }

  join: view_05427 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05425.user_id} = ${view_05427.id} ;;
    required_joins: []
  }

  join: view_05428 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05425.account_id} = ${view_05428.account_id} ;;
    required_joins: [view_05427]
  }

  join: view_05429 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05425.category} = ${view_05429.category} ;;
  }

  access_filter: {
    field: view_05425.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05425.is_deleted} = false ;;
}
