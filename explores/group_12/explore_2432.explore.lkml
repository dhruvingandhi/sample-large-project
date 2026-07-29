# Explore: explore_2432
# Auto-generated LookML Explore File

include: "/views/domain_47/view_07297.view.lkml"
include: "/views/domain_49/view_07299.view.lkml"
include: "/views/domain_50/view_07300.view.lkml"
include: "/views/domain_01/view_07301.view.lkml"

explore: explore_2432 {
  label: "Explore Explore 2432"
  description: "Comprehensive analytics explore joining base view_07297 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07297
  
  always_filter: {
    filters: [view_07297.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07297.created_at_date: "7 days"]
    unless: [view_07297.id, view_07297.status]
  }

  join: view_07299 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07297.user_id} = ${view_07299.id} ;;
    required_joins: []
  }

  join: view_07300 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07297.account_id} = ${view_07300.account_id} ;;
    required_joins: [view_07299]
  }

  join: view_07301 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07297.category} = ${view_07301.category} ;;
  }

  access_filter: {
    field: view_07297.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07297.is_deleted} = false ;;
}
