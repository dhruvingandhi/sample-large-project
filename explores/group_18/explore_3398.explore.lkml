# Explore: explore_3398
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10195.view.lkml"
include: "/views/domain_47/view_10197.view.lkml"
include: "/views/domain_48/view_10198.view.lkml"
include: "/views/domain_49/view_10199.view.lkml"

explore: explore_3398 {
  label: "Explore Explore 3398"
  description: "Comprehensive analytics explore joining base view_10195 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10195
  
  always_filter: {
    filters: [view_10195.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10195.created_at_date: "7 days"]
    unless: [view_10195.id, view_10195.status]
  }

  join: view_10197 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10195.user_id} = ${view_10197.id} ;;
    required_joins: []
  }

  join: view_10198 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10195.account_id} = ${view_10198.account_id} ;;
    required_joins: [view_10197]
  }

  join: view_10199 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10195.category} = ${view_10199.category} ;;
  }

  access_filter: {
    field: view_10195.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10195.is_deleted} = false ;;
}
