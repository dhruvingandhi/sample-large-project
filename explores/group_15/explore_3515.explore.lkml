# Explore: explore_3515
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10546.view.lkml"
include: "/views/domain_48/view_10548.view.lkml"
include: "/views/domain_49/view_10549.view.lkml"
include: "/views/domain_50/view_10550.view.lkml"

explore: explore_3515 {
  label: "Explore Explore 3515"
  description: "Comprehensive analytics explore joining base view_10546 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10546
  
  always_filter: {
    filters: [view_10546.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10546.created_at_date: "7 days"]
    unless: [view_10546.id, view_10546.status]
  }

  join: view_10548 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10546.user_id} = ${view_10548.id} ;;
    required_joins: []
  }

  join: view_10549 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10546.account_id} = ${view_10549.account_id} ;;
    required_joins: [view_10548]
  }

  join: view_10550 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10546.category} = ${view_10550.category} ;;
  }

  access_filter: {
    field: view_10546.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10546.is_deleted} = false ;;
}
