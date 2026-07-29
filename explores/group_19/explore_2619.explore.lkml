# Explore: explore_2619
# Auto-generated LookML Explore File

include: "/views/domain_08/view_07858.view.lkml"
include: "/views/domain_10/view_07860.view.lkml"
include: "/views/domain_11/view_07861.view.lkml"
include: "/views/domain_12/view_07862.view.lkml"

explore: explore_2619 {
  label: "Explore Explore 2619"
  description: "Comprehensive analytics explore joining base view_07858 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07858
  
  always_filter: {
    filters: [view_07858.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07858.created_at_date: "7 days"]
    unless: [view_07858.id, view_07858.status]
  }

  join: view_07860 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07858.user_id} = ${view_07860.id} ;;
    required_joins: []
  }

  join: view_07861 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07858.account_id} = ${view_07861.account_id} ;;
    required_joins: [view_07860]
  }

  join: view_07862 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07858.category} = ${view_07862.category} ;;
  }

  access_filter: {
    field: view_07858.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07858.is_deleted} = false ;;
}
