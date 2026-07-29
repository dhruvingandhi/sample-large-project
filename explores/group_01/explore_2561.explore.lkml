# Explore: explore_2561
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07684.view.lkml"
include: "/views/domain_36/view_07686.view.lkml"
include: "/views/domain_37/view_07687.view.lkml"
include: "/views/domain_38/view_07688.view.lkml"

explore: explore_2561 {
  label: "Explore Explore 2561"
  description: "Comprehensive analytics explore joining base view_07684 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07684
  
  always_filter: {
    filters: [view_07684.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07684.created_at_date: "7 days"]
    unless: [view_07684.id, view_07684.status]
  }

  join: view_07686 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07684.user_id} = ${view_07686.id} ;;
    required_joins: []
  }

  join: view_07687 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07684.account_id} = ${view_07687.account_id} ;;
    required_joins: [view_07686]
  }

  join: view_07688 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07684.category} = ${view_07688.category} ;;
  }

  access_filter: {
    field: view_07684.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07684.is_deleted} = false ;;
}
