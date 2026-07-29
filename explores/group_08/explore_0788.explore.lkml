# Explore: explore_0788
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02365.view.lkml"
include: "/views/domain_17/view_02367.view.lkml"
include: "/views/domain_18/view_02368.view.lkml"
include: "/views/domain_19/view_02369.view.lkml"

explore: explore_0788 {
  label: "Explore Explore 0788"
  description: "Comprehensive analytics explore joining base view_02365 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02365
  
  always_filter: {
    filters: [view_02365.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02365.created_at_date: "7 days"]
    unless: [view_02365.id, view_02365.status]
  }

  join: view_02367 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02365.user_id} = ${view_02367.id} ;;
    required_joins: []
  }

  join: view_02368 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02365.account_id} = ${view_02368.account_id} ;;
    required_joins: [view_02367]
  }

  join: view_02369 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02365.category} = ${view_02369.category} ;;
  }

  access_filter: {
    field: view_02365.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02365.is_deleted} = false ;;
}
