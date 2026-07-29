# Explore: explore_2873
# Auto-generated LookML Explore File

include: "/views/domain_20/view_08620.view.lkml"
include: "/views/domain_22/view_08622.view.lkml"
include: "/views/domain_23/view_08623.view.lkml"
include: "/views/domain_24/view_08624.view.lkml"

explore: explore_2873 {
  label: "Explore Explore 2873"
  description: "Comprehensive analytics explore joining base view_08620 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08620
  
  always_filter: {
    filters: [view_08620.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08620.created_at_date: "7 days"]
    unless: [view_08620.id, view_08620.status]
  }

  join: view_08622 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08620.user_id} = ${view_08622.id} ;;
    required_joins: []
  }

  join: view_08623 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08620.account_id} = ${view_08623.account_id} ;;
    required_joins: [view_08622]
  }

  join: view_08624 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08620.category} = ${view_08624.category} ;;
  }

  access_filter: {
    field: view_08620.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08620.is_deleted} = false ;;
}
