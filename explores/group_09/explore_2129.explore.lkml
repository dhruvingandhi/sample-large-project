# Explore: explore_2129
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06388.view.lkml"
include: "/views/domain_40/view_06390.view.lkml"
include: "/views/domain_41/view_06391.view.lkml"
include: "/views/domain_42/view_06392.view.lkml"

explore: explore_2129 {
  label: "Explore Explore 2129"
  description: "Comprehensive analytics explore joining base view_06388 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06388
  
  always_filter: {
    filters: [view_06388.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06388.created_at_date: "7 days"]
    unless: [view_06388.id, view_06388.status]
  }

  join: view_06390 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06388.user_id} = ${view_06390.id} ;;
    required_joins: []
  }

  join: view_06391 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06388.account_id} = ${view_06391.account_id} ;;
    required_joins: [view_06390]
  }

  join: view_06392 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06388.category} = ${view_06392.category} ;;
  }

  access_filter: {
    field: view_06388.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06388.is_deleted} = false ;;
}
