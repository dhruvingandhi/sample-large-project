# Explore: explore_0180
# Auto-generated LookML Explore File

include: "/views/domain_41/view_00541.view.lkml"
include: "/views/domain_43/view_00543.view.lkml"
include: "/views/domain_44/view_00544.view.lkml"
include: "/views/domain_45/view_00545.view.lkml"

explore: explore_0180 {
  label: "Explore Explore 0180"
  description: "Comprehensive analytics explore joining base view_00541 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00541
  
  always_filter: {
    filters: [view_00541.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00541.created_at_date: "7 days"]
    unless: [view_00541.id, view_00541.status]
  }

  join: view_00543 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00541.user_id} = ${view_00543.id} ;;
    required_joins: []
  }

  join: view_00544 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00541.account_id} = ${view_00544.account_id} ;;
    required_joins: [view_00543]
  }

  join: view_00545 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00541.category} = ${view_00545.category} ;;
  }

  access_filter: {
    field: view_00541.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00541.is_deleted} = false ;;
}
