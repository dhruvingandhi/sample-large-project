# Explore: explore_0383
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01150.view.lkml"
include: "/views/domain_02/view_01152.view.lkml"
include: "/views/domain_03/view_01153.view.lkml"
include: "/views/domain_04/view_01154.view.lkml"

explore: explore_0383 {
  label: "Explore Explore 0383"
  description: "Comprehensive analytics explore joining base view_01150 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01150
  
  always_filter: {
    filters: [view_01150.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01150.created_at_date: "7 days"]
    unless: [view_01150.id, view_01150.status]
  }

  join: view_01152 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01150.user_id} = ${view_01152.id} ;;
    required_joins: []
  }

  join: view_01153 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01150.account_id} = ${view_01153.account_id} ;;
    required_joins: [view_01152]
  }

  join: view_01154 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01150.category} = ${view_01154.category} ;;
  }

  access_filter: {
    field: view_01150.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01150.is_deleted} = false ;;
}
