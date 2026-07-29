# Explore: explore_3821
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11464.view.lkml"
include: "/views/domain_16/view_11466.view.lkml"
include: "/views/domain_17/view_11467.view.lkml"
include: "/views/domain_18/view_11468.view.lkml"

explore: explore_3821 {
  label: "Explore Explore 3821"
  description: "Comprehensive analytics explore joining base view_11464 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11464
  
  always_filter: {
    filters: [view_11464.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11464.created_at_date: "7 days"]
    unless: [view_11464.id, view_11464.status]
  }

  join: view_11466 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11464.user_id} = ${view_11466.id} ;;
    required_joins: []
  }

  join: view_11467 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11464.account_id} = ${view_11467.account_id} ;;
    required_joins: [view_11466]
  }

  join: view_11468 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11464.category} = ${view_11468.category} ;;
  }

  access_filter: {
    field: view_11464.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11464.is_deleted} = false ;;
}
