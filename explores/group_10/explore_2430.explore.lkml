# Explore: explore_2430
# Auto-generated LookML Explore File

include: "/views/domain_41/view_07291.view.lkml"
include: "/views/domain_43/view_07293.view.lkml"
include: "/views/domain_44/view_07294.view.lkml"
include: "/views/domain_45/view_07295.view.lkml"

explore: explore_2430 {
  label: "Explore Explore 2430"
  description: "Comprehensive analytics explore joining base view_07291 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07291
  
  always_filter: {
    filters: [view_07291.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07291.created_at_date: "7 days"]
    unless: [view_07291.id, view_07291.status]
  }

  join: view_07293 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07291.user_id} = ${view_07293.id} ;;
    required_joins: []
  }

  join: view_07294 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07291.account_id} = ${view_07294.account_id} ;;
    required_joins: [view_07293]
  }

  join: view_07295 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07291.category} = ${view_07295.category} ;;
  }

  access_filter: {
    field: view_07291.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07291.is_deleted} = false ;;
}
