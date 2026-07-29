# Explore: explore_1871
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05614.view.lkml"
include: "/views/domain_16/view_05616.view.lkml"
include: "/views/domain_17/view_05617.view.lkml"
include: "/views/domain_18/view_05618.view.lkml"

explore: explore_1871 {
  label: "Explore Explore 1871"
  description: "Comprehensive analytics explore joining base view_05614 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05614
  
  always_filter: {
    filters: [view_05614.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05614.created_at_date: "7 days"]
    unless: [view_05614.id, view_05614.status]
  }

  join: view_05616 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05614.user_id} = ${view_05616.id} ;;
    required_joins: []
  }

  join: view_05617 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05614.account_id} = ${view_05617.account_id} ;;
    required_joins: [view_05616]
  }

  join: view_05618 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05614.category} = ${view_05618.category} ;;
  }

  access_filter: {
    field: view_05614.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05614.is_deleted} = false ;;
}
