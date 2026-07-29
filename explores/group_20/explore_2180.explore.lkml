# Explore: explore_2180
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06541.view.lkml"
include: "/views/domain_43/view_06543.view.lkml"
include: "/views/domain_44/view_06544.view.lkml"
include: "/views/domain_45/view_06545.view.lkml"

explore: explore_2180 {
  label: "Explore Explore 2180"
  description: "Comprehensive analytics explore joining base view_06541 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06541
  
  always_filter: {
    filters: [view_06541.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06541.created_at_date: "7 days"]
    unless: [view_06541.id, view_06541.status]
  }

  join: view_06543 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06541.user_id} = ${view_06543.id} ;;
    required_joins: []
  }

  join: view_06544 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06541.account_id} = ${view_06544.account_id} ;;
    required_joins: [view_06543]
  }

  join: view_06545 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06541.category} = ${view_06545.category} ;;
  }

  access_filter: {
    field: view_06541.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06541.is_deleted} = false ;;
}
