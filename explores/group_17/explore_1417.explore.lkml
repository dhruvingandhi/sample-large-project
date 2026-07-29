# Explore: explore_1417
# Auto-generated LookML Explore File

include: "/views/domain_02/view_04252.view.lkml"
include: "/views/domain_04/view_04254.view.lkml"
include: "/views/domain_05/view_04255.view.lkml"
include: "/views/domain_06/view_04256.view.lkml"

explore: explore_1417 {
  label: "Explore Explore 1417"
  description: "Comprehensive analytics explore joining base view_04252 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04252
  
  always_filter: {
    filters: [view_04252.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04252.created_at_date: "7 days"]
    unless: [view_04252.id, view_04252.status]
  }

  join: view_04254 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04252.user_id} = ${view_04254.id} ;;
    required_joins: []
  }

  join: view_04255 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04252.account_id} = ${view_04255.account_id} ;;
    required_joins: [view_04254]
  }

  join: view_04256 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04252.category} = ${view_04256.category} ;;
  }

  access_filter: {
    field: view_04252.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04252.is_deleted} = false ;;
}
