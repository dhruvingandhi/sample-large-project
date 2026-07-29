# Explore: explore_2557
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07672.view.lkml"
include: "/views/domain_24/view_07674.view.lkml"
include: "/views/domain_25/view_07675.view.lkml"
include: "/views/domain_26/view_07676.view.lkml"

explore: explore_2557 {
  label: "Explore Explore 2557"
  description: "Comprehensive analytics explore joining base view_07672 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07672
  
  always_filter: {
    filters: [view_07672.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07672.created_at_date: "7 days"]
    unless: [view_07672.id, view_07672.status]
  }

  join: view_07674 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07672.user_id} = ${view_07674.id} ;;
    required_joins: []
  }

  join: view_07675 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07672.account_id} = ${view_07675.account_id} ;;
    required_joins: [view_07674]
  }

  join: view_07676 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07672.category} = ${view_07676.category} ;;
  }

  access_filter: {
    field: view_07672.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07672.is_deleted} = false ;;
}
