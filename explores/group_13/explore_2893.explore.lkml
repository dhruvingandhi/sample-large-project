# Explore: explore_2893
# Auto-generated LookML Explore File

include: "/views/domain_30/view_08680.view.lkml"
include: "/views/domain_32/view_08682.view.lkml"
include: "/views/domain_33/view_08683.view.lkml"
include: "/views/domain_34/view_08684.view.lkml"

explore: explore_2893 {
  label: "Explore Explore 2893"
  description: "Comprehensive analytics explore joining base view_08680 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08680
  
  always_filter: {
    filters: [view_08680.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08680.created_at_date: "7 days"]
    unless: [view_08680.id, view_08680.status]
  }

  join: view_08682 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08680.user_id} = ${view_08682.id} ;;
    required_joins: []
  }

  join: view_08683 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08680.account_id} = ${view_08683.account_id} ;;
    required_joins: [view_08682]
  }

  join: view_08684 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08680.category} = ${view_08684.category} ;;
  }

  access_filter: {
    field: view_08680.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08680.is_deleted} = false ;;
}
