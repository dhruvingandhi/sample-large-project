# Explore: explore_0530
# Auto-generated LookML Explore File

include: "/views/domain_41/view_01591.view.lkml"
include: "/views/domain_43/view_01593.view.lkml"
include: "/views/domain_44/view_01594.view.lkml"
include: "/views/domain_45/view_01595.view.lkml"

explore: explore_0530 {
  label: "Explore Explore 0530"
  description: "Comprehensive analytics explore joining base view_01591 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01591
  
  always_filter: {
    filters: [view_01591.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01591.created_at_date: "7 days"]
    unless: [view_01591.id, view_01591.status]
  }

  join: view_01593 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01591.user_id} = ${view_01593.id} ;;
    required_joins: []
  }

  join: view_01594 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01591.account_id} = ${view_01594.account_id} ;;
    required_joins: [view_01593]
  }

  join: view_01595 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01591.category} = ${view_01595.category} ;;
  }

  access_filter: {
    field: view_01591.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01591.is_deleted} = false ;;
}
