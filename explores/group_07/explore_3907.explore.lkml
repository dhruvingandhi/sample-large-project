# Explore: explore_3907
# Auto-generated LookML Explore File

include: "/views/domain_22/view_11722.view.lkml"
include: "/views/domain_24/view_11724.view.lkml"
include: "/views/domain_25/view_11725.view.lkml"
include: "/views/domain_26/view_11726.view.lkml"

explore: explore_3907 {
  label: "Explore Explore 3907"
  description: "Comprehensive analytics explore joining base view_11722 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11722
  
  always_filter: {
    filters: [view_11722.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11722.created_at_date: "7 days"]
    unless: [view_11722.id, view_11722.status]
  }

  join: view_11724 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11722.user_id} = ${view_11724.id} ;;
    required_joins: []
  }

  join: view_11725 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11722.account_id} = ${view_11725.account_id} ;;
    required_joins: [view_11724]
  }

  join: view_11726 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11722.category} = ${view_11726.category} ;;
  }

  access_filter: {
    field: view_11722.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11722.is_deleted} = false ;;
}
