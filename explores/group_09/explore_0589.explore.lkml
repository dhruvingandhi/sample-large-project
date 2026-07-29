# Explore: explore_0589
# Auto-generated LookML Explore File

include: "/views/domain_18/view_01768.view.lkml"
include: "/views/domain_20/view_01770.view.lkml"
include: "/views/domain_21/view_01771.view.lkml"
include: "/views/domain_22/view_01772.view.lkml"

explore: explore_0589 {
  label: "Explore Explore 0589"
  description: "Comprehensive analytics explore joining base view_01768 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01768
  
  always_filter: {
    filters: [view_01768.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01768.created_at_date: "7 days"]
    unless: [view_01768.id, view_01768.status]
  }

  join: view_01770 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01768.user_id} = ${view_01770.id} ;;
    required_joins: []
  }

  join: view_01771 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01768.account_id} = ${view_01771.account_id} ;;
    required_joins: [view_01770]
  }

  join: view_01772 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01768.category} = ${view_01772.category} ;;
  }

  access_filter: {
    field: view_01768.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01768.is_deleted} = false ;;
}
