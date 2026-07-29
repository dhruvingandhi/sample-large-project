# Explore: explore_1630
# Auto-generated LookML Explore File

include: "/views/domain_41/view_04891.view.lkml"
include: "/views/domain_43/view_04893.view.lkml"
include: "/views/domain_44/view_04894.view.lkml"
include: "/views/domain_45/view_04895.view.lkml"

explore: explore_1630 {
  label: "Explore Explore 1630"
  description: "Comprehensive analytics explore joining base view_04891 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04891
  
  always_filter: {
    filters: [view_04891.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04891.created_at_date: "7 days"]
    unless: [view_04891.id, view_04891.status]
  }

  join: view_04893 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04891.user_id} = ${view_04893.id} ;;
    required_joins: []
  }

  join: view_04894 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04891.account_id} = ${view_04894.account_id} ;;
    required_joins: [view_04893]
  }

  join: view_04895 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04891.category} = ${view_04895.category} ;;
  }

  access_filter: {
    field: view_04891.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04891.is_deleted} = false ;;
}
