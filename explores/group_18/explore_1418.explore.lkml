# Update for 2000 file diff target
# Explore: explore_1418
# Auto-generated LookML Explore File

include: "/views/domain_05/view_04255.view.lkml"
include: "/views/domain_07/view_04257.view.lkml"
include: "/views/domain_08/view_04258.view.lkml"
include: "/views/domain_09/view_04259.view.lkml"

explore: explore_1418 {
  label: "Explore Explore 1418"
  description: "Comprehensive analytics explore joining base view_04255 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04255
  
  always_filter: {
    filters: [view_04255.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04255.created_at_date: "7 days"]
    unless: [view_04255.id, view_04255.status]
  }

  join: view_04257 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04255.user_id} = ${view_04257.id} ;;
    required_joins: []
  }

  join: view_04258 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04255.account_id} = ${view_04258.account_id} ;;
    required_joins: [view_04257]
  }

  join: view_04259 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04255.category} = ${view_04259.category} ;;
  }

  access_filter: {
    field: view_04255.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04255.is_deleted} = false ;;
}
