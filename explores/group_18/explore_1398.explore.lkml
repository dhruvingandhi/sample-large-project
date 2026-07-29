# Explore: explore_1398
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04195.view.lkml"
include: "/views/domain_47/view_04197.view.lkml"
include: "/views/domain_48/view_04198.view.lkml"
include: "/views/domain_49/view_04199.view.lkml"

explore: explore_1398 {
  label: "Explore Explore 1398"
  description: "Comprehensive analytics explore joining base view_04195 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04195
  
  always_filter: {
    filters: [view_04195.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04195.created_at_date: "7 days"]
    unless: [view_04195.id, view_04195.status]
  }

  join: view_04197 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04195.user_id} = ${view_04197.id} ;;
    required_joins: []
  }

  join: view_04198 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04195.account_id} = ${view_04198.account_id} ;;
    required_joins: [view_04197]
  }

  join: view_04199 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04195.category} = ${view_04199.category} ;;
  }

  access_filter: {
    field: view_04195.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04195.is_deleted} = false ;;
}
