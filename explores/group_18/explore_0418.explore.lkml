# Update for 2000 file diff target
# Explore: explore_0418
# Auto-generated LookML Explore File

include: "/views/domain_05/view_01255.view.lkml"
include: "/views/domain_07/view_01257.view.lkml"
include: "/views/domain_08/view_01258.view.lkml"
include: "/views/domain_09/view_01259.view.lkml"

explore: explore_0418 {
  label: "Explore Explore 0418"
  description: "Comprehensive analytics explore joining base view_01255 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01255
  
  always_filter: {
    filters: [view_01255.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01255.created_at_date: "7 days"]
    unless: [view_01255.id, view_01255.status]
  }

  join: view_01257 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01255.user_id} = ${view_01257.id} ;;
    required_joins: []
  }

  join: view_01258 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01255.account_id} = ${view_01258.account_id} ;;
    required_joins: [view_01257]
  }

  join: view_01259 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01255.category} = ${view_01259.category} ;;
  }

  access_filter: {
    field: view_01255.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01255.is_deleted} = false ;;
}
