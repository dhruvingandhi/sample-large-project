# Explore: explore_0573
# Auto-generated LookML Explore File

include: "/views/domain_20/view_01720.view.lkml"
include: "/views/domain_22/view_01722.view.lkml"
include: "/views/domain_23/view_01723.view.lkml"
include: "/views/domain_24/view_01724.view.lkml"

explore: explore_0573 {
  label: "Explore Explore 0573"
  description: "Comprehensive analytics explore joining base view_01720 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01720
  
  always_filter: {
    filters: [view_01720.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01720.created_at_date: "7 days"]
    unless: [view_01720.id, view_01720.status]
  }

  join: view_01722 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01720.user_id} = ${view_01722.id} ;;
    required_joins: []
  }

  join: view_01723 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01720.account_id} = ${view_01723.account_id} ;;
    required_joins: [view_01722]
  }

  join: view_01724 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01720.category} = ${view_01724.category} ;;
  }

  access_filter: {
    field: view_01720.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01720.is_deleted} = false ;;
}
