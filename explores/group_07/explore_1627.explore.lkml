# Explore: explore_1627
# Auto-generated LookML Explore File

include: "/views/domain_32/view_04882.view.lkml"
include: "/views/domain_34/view_04884.view.lkml"
include: "/views/domain_35/view_04885.view.lkml"
include: "/views/domain_36/view_04886.view.lkml"

explore: explore_1627 {
  label: "Explore Explore 1627"
  description: "Comprehensive analytics explore joining base view_04882 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04882
  
  always_filter: {
    filters: [view_04882.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04882.created_at_date: "7 days"]
    unless: [view_04882.id, view_04882.status]
  }

  join: view_04884 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04882.user_id} = ${view_04884.id} ;;
    required_joins: []
  }

  join: view_04885 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04882.account_id} = ${view_04885.account_id} ;;
    required_joins: [view_04884]
  }

  join: view_04886 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04882.category} = ${view_04886.category} ;;
  }

  access_filter: {
    field: view_04882.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04882.is_deleted} = false ;;
}
