# Explore: explore_0528
# Auto-generated LookML Explore File

include: "/views/domain_35/view_01585.view.lkml"
include: "/views/domain_37/view_01587.view.lkml"
include: "/views/domain_38/view_01588.view.lkml"
include: "/views/domain_39/view_01589.view.lkml"

explore: explore_0528 {
  label: "Explore Explore 0528"
  description: "Comprehensive analytics explore joining base view_01585 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01585
  
  always_filter: {
    filters: [view_01585.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01585.created_at_date: "7 days"]
    unless: [view_01585.id, view_01585.status]
  }

  join: view_01587 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01585.user_id} = ${view_01587.id} ;;
    required_joins: []
  }

  join: view_01588 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01585.account_id} = ${view_01588.account_id} ;;
    required_joins: [view_01587]
  }

  join: view_01589 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01585.category} = ${view_01589.category} ;;
  }

  access_filter: {
    field: view_01585.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01585.is_deleted} = false ;;
}
