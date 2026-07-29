# Explore: explore_2539
# Auto-generated LookML Explore File

include: "/views/domain_18/view_07618.view.lkml"
include: "/views/domain_20/view_07620.view.lkml"
include: "/views/domain_21/view_07621.view.lkml"
include: "/views/domain_22/view_07622.view.lkml"

explore: explore_2539 {
  label: "Explore Explore 2539"
  description: "Comprehensive analytics explore joining base view_07618 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07618
  
  always_filter: {
    filters: [view_07618.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07618.created_at_date: "7 days"]
    unless: [view_07618.id, view_07618.status]
  }

  join: view_07620 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07618.user_id} = ${view_07620.id} ;;
    required_joins: []
  }

  join: view_07621 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07618.account_id} = ${view_07621.account_id} ;;
    required_joins: [view_07620]
  }

  join: view_07622 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07618.category} = ${view_07622.category} ;;
  }

  access_filter: {
    field: view_07618.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07618.is_deleted} = false ;;
}
