# Explore: explore_1191
# Auto-generated LookML Explore File

include: "/views/domain_24/view_03574.view.lkml"
include: "/views/domain_26/view_03576.view.lkml"
include: "/views/domain_27/view_03577.view.lkml"
include: "/views/domain_28/view_03578.view.lkml"

explore: explore_1191 {
  label: "Explore Explore 1191"
  description: "Comprehensive analytics explore joining base view_03574 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03574
  
  always_filter: {
    filters: [view_03574.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03574.created_at_date: "7 days"]
    unless: [view_03574.id, view_03574.status]
  }

  join: view_03576 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03574.user_id} = ${view_03576.id} ;;
    required_joins: []
  }

  join: view_03577 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03574.account_id} = ${view_03577.account_id} ;;
    required_joins: [view_03576]
  }

  join: view_03578 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03574.category} = ${view_03578.category} ;;
  }

  access_filter: {
    field: view_03574.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03574.is_deleted} = false ;;
}
