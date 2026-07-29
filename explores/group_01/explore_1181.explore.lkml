# Explore: explore_1181
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03544.view.lkml"
include: "/views/domain_46/view_03546.view.lkml"
include: "/views/domain_47/view_03547.view.lkml"
include: "/views/domain_48/view_03548.view.lkml"

explore: explore_1181 {
  label: "Explore Explore 1181"
  description: "Comprehensive analytics explore joining base view_03544 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03544
  
  always_filter: {
    filters: [view_03544.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03544.created_at_date: "7 days"]
    unless: [view_03544.id, view_03544.status]
  }

  join: view_03546 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03544.user_id} = ${view_03546.id} ;;
    required_joins: []
  }

  join: view_03547 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03544.account_id} = ${view_03547.account_id} ;;
    required_joins: [view_03546]
  }

  join: view_03548 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03544.category} = ${view_03548.category} ;;
  }

  access_filter: {
    field: view_03544.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03544.is_deleted} = false ;;
}
