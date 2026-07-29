# Explore: explore_2181
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06544.view.lkml"
include: "/views/domain_46/view_06546.view.lkml"
include: "/views/domain_47/view_06547.view.lkml"
include: "/views/domain_48/view_06548.view.lkml"

explore: explore_2181 {
  label: "Explore Explore 2181"
  description: "Comprehensive analytics explore joining base view_06544 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06544
  
  always_filter: {
    filters: [view_06544.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06544.created_at_date: "7 days"]
    unless: [view_06544.id, view_06544.status]
  }

  join: view_06546 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06544.user_id} = ${view_06546.id} ;;
    required_joins: []
  }

  join: view_06547 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06544.account_id} = ${view_06547.account_id} ;;
    required_joins: [view_06546]
  }

  join: view_06548 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06544.category} = ${view_06548.category} ;;
  }

  access_filter: {
    field: view_06544.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06544.is_deleted} = false ;;
}
