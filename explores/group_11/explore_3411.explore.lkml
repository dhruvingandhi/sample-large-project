# Explore: explore_3411
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10234.view.lkml"
include: "/views/domain_36/view_10236.view.lkml"
include: "/views/domain_37/view_10237.view.lkml"
include: "/views/domain_38/view_10238.view.lkml"

explore: explore_3411 {
  label: "Explore Explore 3411"
  description: "Comprehensive analytics explore joining base view_10234 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10234
  
  always_filter: {
    filters: [view_10234.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10234.created_at_date: "7 days"]
    unless: [view_10234.id, view_10234.status]
  }

  join: view_10236 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10234.user_id} = ${view_10236.id} ;;
    required_joins: []
  }

  join: view_10237 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10234.account_id} = ${view_10237.account_id} ;;
    required_joins: [view_10236]
  }

  join: view_10238 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10234.category} = ${view_10238.category} ;;
  }

  access_filter: {
    field: view_10234.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10234.is_deleted} = false ;;
}
