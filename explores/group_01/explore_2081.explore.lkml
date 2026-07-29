# Explore: explore_2081
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06244.view.lkml"
include: "/views/domain_46/view_06246.view.lkml"
include: "/views/domain_47/view_06247.view.lkml"
include: "/views/domain_48/view_06248.view.lkml"

explore: explore_2081 {
  label: "Explore Explore 2081"
  description: "Comprehensive analytics explore joining base view_06244 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06244
  
  always_filter: {
    filters: [view_06244.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06244.created_at_date: "7 days"]
    unless: [view_06244.id, view_06244.status]
  }

  join: view_06246 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06244.user_id} = ${view_06246.id} ;;
    required_joins: []
  }

  join: view_06247 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06244.account_id} = ${view_06247.account_id} ;;
    required_joins: [view_06246]
  }

  join: view_06248 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06244.category} = ${view_06248.category} ;;
  }

  access_filter: {
    field: view_06244.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06244.is_deleted} = false ;;
}
