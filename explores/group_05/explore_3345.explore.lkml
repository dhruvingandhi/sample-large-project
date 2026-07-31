# Update for 500 file diff target
# Explore: explore_3345
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10036.view.lkml"
include: "/views/domain_38/view_10038.view.lkml"
include: "/views/domain_39/view_10039.view.lkml"
include: "/views/domain_40/view_10040.view.lkml"

explore: explore_3345 {
  label: "Explore Explore 3345"
  description: "Comprehensive analytics explore joining base view_10036 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10036
  
  always_filter: {
    filters: [view_10036.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10036.created_at_date: "7 days"]
    unless: [view_10036.id, view_10036.status]
  }

  join: view_10038 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10036.user_id} = ${view_10038.id} ;;
    required_joins: []
  }

  join: view_10039 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10036.account_id} = ${view_10039.account_id} ;;
    required_joins: [view_10038]
  }

  join: view_10040 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10036.category} = ${view_10040.category} ;;
  }

  access_filter: {
    field: view_10036.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10036.is_deleted} = false ;;
}
