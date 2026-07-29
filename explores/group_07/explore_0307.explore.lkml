# Explore: explore_0307
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00922.view.lkml"
include: "/views/domain_24/view_00924.view.lkml"
include: "/views/domain_25/view_00925.view.lkml"
include: "/views/domain_26/view_00926.view.lkml"

explore: explore_0307 {
  label: "Explore Explore 0307"
  description: "Comprehensive analytics explore joining base view_00922 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00922
  
  always_filter: {
    filters: [view_00922.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00922.created_at_date: "7 days"]
    unless: [view_00922.id, view_00922.status]
  }

  join: view_00924 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00922.user_id} = ${view_00924.id} ;;
    required_joins: []
  }

  join: view_00925 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00922.account_id} = ${view_00925.account_id} ;;
    required_joins: [view_00924]
  }

  join: view_00926 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00922.category} = ${view_00926.category} ;;
  }

  access_filter: {
    field: view_00922.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00922.is_deleted} = false ;;
}
