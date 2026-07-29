# Explore: explore_3181
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09544.view.lkml"
include: "/views/domain_46/view_09546.view.lkml"
include: "/views/domain_47/view_09547.view.lkml"
include: "/views/domain_48/view_09548.view.lkml"

explore: explore_3181 {
  label: "Explore Explore 3181"
  description: "Comprehensive analytics explore joining base view_09544 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09544
  
  always_filter: {
    filters: [view_09544.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09544.created_at_date: "7 days"]
    unless: [view_09544.id, view_09544.status]
  }

  join: view_09546 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09544.user_id} = ${view_09546.id} ;;
    required_joins: []
  }

  join: view_09547 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09544.account_id} = ${view_09547.account_id} ;;
    required_joins: [view_09546]
  }

  join: view_09548 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09544.category} = ${view_09548.category} ;;
  }

  access_filter: {
    field: view_09544.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09544.is_deleted} = false ;;
}
