# Explore: explore_2808
# Auto-generated LookML Explore File

include: "/views/domain_25/view_08425.view.lkml"
include: "/views/domain_27/view_08427.view.lkml"
include: "/views/domain_28/view_08428.view.lkml"
include: "/views/domain_29/view_08429.view.lkml"

explore: explore_2808 {
  label: "Explore Explore 2808"
  description: "Comprehensive analytics explore joining base view_08425 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08425
  
  always_filter: {
    filters: [view_08425.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08425.created_at_date: "7 days"]
    unless: [view_08425.id, view_08425.status]
  }

  join: view_08427 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08425.user_id} = ${view_08427.id} ;;
    required_joins: []
  }

  join: view_08428 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08425.account_id} = ${view_08428.account_id} ;;
    required_joins: [view_08427]
  }

  join: view_08429 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08425.category} = ${view_08429.category} ;;
  }

  access_filter: {
    field: view_08425.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08425.is_deleted} = false ;;
}
