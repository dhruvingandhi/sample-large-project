# Explore: explore_1880
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05641.view.lkml"
include: "/views/domain_43/view_05643.view.lkml"
include: "/views/domain_44/view_05644.view.lkml"
include: "/views/domain_45/view_05645.view.lkml"

explore: explore_1880 {
  label: "Explore Explore 1880"
  description: "Comprehensive analytics explore joining base view_05641 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05641
  
  always_filter: {
    filters: [view_05641.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05641.created_at_date: "7 days"]
    unless: [view_05641.id, view_05641.status]
  }

  join: view_05643 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05641.user_id} = ${view_05643.id} ;;
    required_joins: []
  }

  join: view_05644 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05641.account_id} = ${view_05644.account_id} ;;
    required_joins: [view_05643]
  }

  join: view_05645 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05641.category} = ${view_05645.category} ;;
  }

  access_filter: {
    field: view_05641.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05641.is_deleted} = false ;;
}
