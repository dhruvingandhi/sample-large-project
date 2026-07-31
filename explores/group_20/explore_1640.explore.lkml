# Update for 2000 file diff target
# Explore: explore_1640
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04921.view.lkml"
include: "/views/domain_23/view_04923.view.lkml"
include: "/views/domain_24/view_04924.view.lkml"
include: "/views/domain_25/view_04925.view.lkml"

explore: explore_1640 {
  label: "Explore Explore 1640"
  description: "Comprehensive analytics explore joining base view_04921 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04921
  
  always_filter: {
    filters: [view_04921.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04921.created_at_date: "7 days"]
    unless: [view_04921.id, view_04921.status]
  }

  join: view_04923 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04921.user_id} = ${view_04923.id} ;;
    required_joins: []
  }

  join: view_04924 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04921.account_id} = ${view_04924.account_id} ;;
    required_joins: [view_04923]
  }

  join: view_04925 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04921.category} = ${view_04925.category} ;;
  }

  access_filter: {
    field: view_04921.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04921.is_deleted} = false ;;
}
