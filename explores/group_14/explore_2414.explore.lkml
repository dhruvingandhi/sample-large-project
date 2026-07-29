# Explore: explore_2414
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07243.view.lkml"
include: "/views/domain_45/view_07245.view.lkml"
include: "/views/domain_46/view_07246.view.lkml"
include: "/views/domain_47/view_07247.view.lkml"

explore: explore_2414 {
  label: "Explore Explore 2414"
  description: "Comprehensive analytics explore joining base view_07243 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07243
  
  always_filter: {
    filters: [view_07243.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07243.created_at_date: "7 days"]
    unless: [view_07243.id, view_07243.status]
  }

  join: view_07245 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07243.user_id} = ${view_07245.id} ;;
    required_joins: []
  }

  join: view_07246 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07243.account_id} = ${view_07246.account_id} ;;
    required_joins: [view_07245]
  }

  join: view_07247 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07243.category} = ${view_07247.category} ;;
  }

  access_filter: {
    field: view_07243.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07243.is_deleted} = false ;;
}
