# Explore: explore_2835
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08506.view.lkml"
include: "/views/domain_08/view_08508.view.lkml"
include: "/views/domain_09/view_08509.view.lkml"
include: "/views/domain_10/view_08510.view.lkml"

explore: explore_2835 {
  label: "Explore Explore 2835"
  description: "Comprehensive analytics explore joining base view_08506 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08506
  
  always_filter: {
    filters: [view_08506.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08506.created_at_date: "7 days"]
    unless: [view_08506.id, view_08506.status]
  }

  join: view_08508 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08506.user_id} = ${view_08508.id} ;;
    required_joins: []
  }

  join: view_08509 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08506.account_id} = ${view_08509.account_id} ;;
    required_joins: [view_08508]
  }

  join: view_08510 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08506.category} = ${view_08510.category} ;;
  }

  access_filter: {
    field: view_08506.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08506.is_deleted} = false ;;
}
