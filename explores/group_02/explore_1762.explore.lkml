# Update for 500 file diff target
# Explore: explore_1762
# Auto-generated LookML Explore File

include: "/views/domain_37/view_05287.view.lkml"
include: "/views/domain_39/view_05289.view.lkml"
include: "/views/domain_40/view_05290.view.lkml"
include: "/views/domain_41/view_05291.view.lkml"

explore: explore_1762 {
  label: "Explore Explore 1762"
  description: "Comprehensive analytics explore joining base view_05287 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05287
  
  always_filter: {
    filters: [view_05287.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05287.created_at_date: "7 days"]
    unless: [view_05287.id, view_05287.status]
  }

  join: view_05289 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05287.user_id} = ${view_05289.id} ;;
    required_joins: []
  }

  join: view_05290 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05287.account_id} = ${view_05290.account_id} ;;
    required_joins: [view_05289]
  }

  join: view_05291 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05287.category} = ${view_05291.category} ;;
  }

  access_filter: {
    field: view_05287.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05287.is_deleted} = false ;;
}
